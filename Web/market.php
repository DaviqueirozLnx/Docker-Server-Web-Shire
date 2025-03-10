<?php require_once 'engine/init.php'; include 'layout/overall/header.php';

$server = $config['shop']['imageServer'];
$imageType = $config['shop']['imageType'];
$items = getItemList();
$compare = &$_GET['compare'];

// If we failed to load items.xml, a string is returned (not an array)
// with the attempted loaded file path.
// So if $items is not an array, send an error message, include the footer and ignore rest of this page.
if (is_array($items) === false):
	?>
		<h1>Mercado</h1>
		<p>Falha ao carregar a lista de itens.</p>
		<p>Tentou carregar este arquivo: <?php echo $items; ?></p>
		<p>Configure o 'server_path' corretamente no arquivo config.php.</p>
		<p>Se o caminho estiver correto, certifique-se de que o usuário da web tenha acesso para lê-lo.</p>
		<?php

	include 'layout/overall/footer.php';
	die();
endif;

// If you are not comparing any items, present the list.
if (!$compare) {
	$cache = new Cache('engine/cache/market');
	$cache->setExpiration(60);
	if ($cache->hasExpired()) {
		$offers = array(
			'wts' => mysql_select_multi("SELECT `mo`.`id`, `mo`.`itemtype` AS `item_id`, `mo`.`amount`, `mo`.`price`, `mo`.`created`, `mo`.`anonymous`, `p`.`name` AS `player_name` FROM `market_offers` AS `mo` INNER JOIN `players` AS `p` ON `mo`.`player_id`=`p`.`id` WHERE `mo`.`sale` = '1'  ORDER BY `mo`.`created` DESC;"),
			'wtb' => mysql_select_multi("SELECT `mo`.`id`, `mo`.`itemtype` AS `item_id`, `mo`.`amount`, `mo`.`price`, `mo`.`created`, `mo`.`anonymous`, `p`.`name` AS `player_name` FROM `market_offers` AS `mo` INNER JOIN `players` AS `p` ON `mo`.`player_id`=`p`.`id` WHERE `mo`.`sale` = '0'  ORDER BY `mo`.`created` DESC;")
		);
		$cache->setContent($offers);
		$cache->save();
	} else {
		$offers = $cache->load();
	}
	?>
	<h1>Mercado</h1>
	<p>Você pode comprar e vender itens clicando no <a target="_BLANK" href="http://znote.eu/images/depotmarket.jpg">mercado no depósito.</a> <br>Para vender um item: Coloque o item dentro do seu depósito, clique no mercado, procure o seu item e venda-o.</p>
	<form action="" class="market_item_search">
		<label for="compareSearch">Buscar Item:</label>
		<input type="text" id="compareSearch" name="compare">
		<input type="submit" value="Search">
	</form>
	<h2>WTS: Quer vender</h2>
	<table class="table tbl-hover">
		<tr class="yellow">
			<td>Item name</td>
			<td>Item</td>
			<td>Count</td>
			<td>Price for 1</td>
			<td>Added</td>
			<td>By</td>
			<td>Compare</td>
		</tr>
		<?php
		foreach (($offers['wts'] ? $offers['wts'] : array()) as $o) {
		?>
		<tr>
			<td><?php echo (isset($items[$o['item_id']])) ? $items[$o['item_id']] : $o['item_id']; ?></td>
			<td><img src="<?php echo "http://".$server."/".$o['item_id'].".".$imageType; ?>" alt="Item Image"></td>
			<td><?php echo $o['amount']; ?></td>
			<td><?php echo number_format($o['price'], 0, "", " "); ?></td>
			<td><?php echo getClock($o['created'], true, true); ?></td>
			<td><?php echo ($o['anonymous'] == 1) ? 'Anonymous' : "<a target='_BLANK' href='characterprofile.php?name=".$o['player_name']."'>".$o['player_name']."</a>"; ?></td>
			<td><a href="?compare=<?php echo $o['item_id']; ?>"><button>Compare</button></a></td>
		</tr>
		<?php
		}
		?>
	</table>
	<h2>WTB: Quer comprar</h2>
	<table class="table tbl-hover">
		<tr class="yellow">
			<td>Item name</td>
			<td>Item</td>
			<td>Count</td>
			<td>Price for 1</td>
			<td>Added</td>
			<td>By</td>
			<td>Compare</td>
		</tr>
		<?php
		foreach (($offers['wtb'] ? $offers['wtb'] : array()) as $o) {
		?>
		<tr>
			<td><?php echo (isset($items[$o['item_id']])) ? $items[$o['item_id']] : $o['item_id']; ?></td>
			<td><img src="<?php echo "http://".$server."/".$o['item_id'].".".$imageType; ?>" alt="Item Image"></td>
			<td><?php echo $o['amount']; ?></td>
			<td><?php echo number_format($o['price'], 0, "", " "); ?></td>
			<td><?php echo getClock($o['created'], true, true); ?></td>
			<td><?php echo ($o['anonymous'] == 1) ? 'Anonymous' : "<a target='_BLANK' href='characterprofile.php?name=".$o['player_name']."'>".$o['player_name']."</a>"; ?></td>
			<td><a href="?compare=<?php echo $o['item_id']; ?>"><button>Compare</button></a></td>
		</tr>
		<?php
		}
		?>
	</table>
	<?php
} else {
	// Else You want to compare price
	$compare = ((int)$compare > 0) ? (int)$compare : getValue($compare);

	$condition = "`itemtype`='$compare'";

	if (is_string($compare)) {
		$query = array();
		foreach ($items as $id => $name) {
			if (strpos(strtolower($name), stripslashes(strtolower($compare))) !== false) {
				$query[] = $id;
			}
		}
		$condition = (!empty($query)) ? "`itemtype` IN (". implode(',', $query) .")" : false;
	}

	// First list active bids
	if ($condition === false) {
		$offers = array();
		$historyOffers = array();
	} else {
		$offers = mysql_select_multi("SELECT `mo`.`id`, `mo`.`sale`, `mo`.`itemtype` AS `item_id`, `mo`.`amount`, `mo`.`price`, `mo`.`created`, `mo`.`anonymous`, `p`.`name` AS `player_name` FROM `market_offers` AS `mo` INNER JOIN `players` AS `p` ON `mo`.`player_id`=`p`.`id` WHERE `mo`.$condition ORDER BY `mo`.`price` ASC;");
		$historyOffers = mysql_select_multi("SELECT `id`, `itemtype` AS `item_id`, `amount`, `price`, `inserted`, `expires_at` FROM `market_history` WHERE $condition AND `state`='255' ORDER BY `price` ASC;");
	}
	$buylist = false;

	// Markup
	$itemname = (isset($items[$compare])) ? $items[$compare] : $compare;
	if (!is_string($compare)) echo "<h1>Comparing item: ". $itemname ."</h1>";
	else echo "<h1>Search: ". stripslashes($compare) ."</h1>";
	?>
	<a href="market.php"><button>Go back</button></a>
	<h2>Active offers</h2>
	<table class="table tbl-hover">
		<tr class="yellow">
			<td>Item name</td>
			<td>Item</td>
			<td>Count</td>
			<td>Price for 1</td>
			<td>Added</td>
			<td>By</td>
		</tr>
		<?php
		foreach (($offers ? $offers : array()) as $o) {
			$wtb = false;
			if ($o['sale'] == 0) {
				$wtb = true;
				if ($buylist === false) $buylist = array();
				$buylist[] = $o;
			} else {
				?>
				<tr>
					<td><?php echo (isset($items[$o['item_id']])) ? $items[$o['item_id']] : $o['item_id']; ?></td>
					<td><img src="<?php echo "http://".$server."/".$o['item_id'].".".$imageType; ?>" alt="Item Image"></td>
					<td><?php echo $o['amount']; ?></td>
					<td><?php echo number_format($o['price'], 0, "", " "); ?></td>
					<td><?php echo getClock($o['created'], true, true); ?></td>
					<td><?php echo ($o['anonymous'] == 1) ? 'Anonymous' : "<a target='_BLANK' href='characterprofile.php?name=".$o['player_name']."'>".$o['player_name']."</a>"; ?></td>
				</tr>
				<?php
			}
		}
		?>
	</table>
	<?php
	if ($buylist !== false) {
		?>
		<h2>Want to buy:</h2>
		<table class="table tbl-hover">
			<tr class="yellow">
				<td>Item name</td>
				<td>Item</td>
				<td>Count</td>
				<td>Price for 1</td>
				<td>Added</td>
				<td>By</td>
			</tr>
			<?php
			foreach ($buylist as $o) {
				?>
				<tr>
					<td><?php echo (isset($items[$o['item_id']])) ? $items[$o['item_id']] : $o['item_id']; ?></td>
					<td><img src="<?php echo "http://".$server."/".$o['item_id'].".".$imageType; ?>" alt="Item Image"></td>
					<td><?php echo $o['amount']; ?></td>
					<td><?php echo number_format($o['price'], 0, "", " "); ?></td>
					<td><?php echo getClock($o['created'], true, true); ?></td>
					<td><?php echo ($o['anonymous'] == 1) ? 'Anonymous' : "<a target='_BLANK' href='characterprofile.php?name=".$o['player_name']."'>".$o['player_name']."</a>"; ?></td>
				</tr>
				<?php
			}
			?>
		</table>
		<?php
	}
	?>
	<h2>Old purchased offers</h2>
	<table class="table tbl-hover">
		<tr class="yellow">
			<td>Item name</td>
			<td>Item</td>
			<td>Count</td>
			<td>Price for 1</td>
			<td>Offer sold</td>
		</tr>
		<?php
		foreach (($historyOffers ? $historyOffers : array()) as $o) {
		?>
		<tr>
			<td><?php echo (isset($items[$o['item_id']])) ? $items[$o['item_id']] : $o['item_id']; ?></td>
			<td><img src="<?php echo "http://".$server."/".$o['item_id'].".".$imageType; ?>" alt="Item Image"></td>
			<td><?php echo $o['amount']; ?></td>
			<td><?php echo number_format($o['price'], 0, "", " "); ?></td>
			<td><?php echo getClock($o['inserted'], true, true); ?></td>
		</tr>
		<?php
		}
		?>
	</table>
	<?php
}
include 'layout/overall/footer.php'; ?>
