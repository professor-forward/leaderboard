<?php

$dbconn = pg_connect("host=localhost port=5432 dbname=leaderboard");

$result = pg_query($dbconn, "SELECT identifier, name, venue, start_date FROM competitions");
$data = pg_fetch_all($result);
?>

<style>
.table-container {
  margin: 20px;
}
table {
  width: 100%;
}
table tr th {
  text-align: left;
  background-color: #D9E2EC;
}
</style>

<h1>Competitions</h1>
<div class="table-container">
  <table>
    <tr>
      <th>Name</th>
      <th>Venue</th>
      <th>Start Date</th>
    </tr>
    <?php foreach ($data as $row) {?>
      <tr>
        <td><a href="competition.php?id=<?php echo $row["identifier"] ?>"><?php echo $row["name"] ?></a></td>
        <td><?php echo $row["venue"] ?></td>
        <td><?php echo $row["start_date"] ?></td>
      </tr>
    <?php } ?>
  </table>
</div>