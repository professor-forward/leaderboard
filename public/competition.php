<?php


if (!isset($_GET["id"])) {
    header('Location: index.php');
    exit;
}

$competitionId = $_GET["id"];
$dbconn = pg_connect("host=localhost port=5432 dbname=leaderboard");
$sql = 'SELECT * FROM competitions WHERE identifier = $1';
$result = pg_query_params($dbconn, $sql, [$competitionId]);
$data = pg_fetch_all($result);

if (empty($data)) {
  $competition = null;
  $athletes = [];
} else {
  $competition = $data[0];
  $sql = 'SELECT athletes.name,
                 registrations.gender,
                 registrations.age
          FROM registrations
          INNER JOIN athletes ON athletes.id = registrations.athlete_id
          WHERE registrations.competition_id = $1
          ORDER BY athletes.name';
  $result = pg_query_params($dbconn, $sql, [$competition["id"]]);
  $athletes = pg_fetch_all($result);
}

if (empty($competition)) {
  ?><h1>Unknown competiton <?php echo $competitionId; ?></h1><?php
} elseif (empty($athletes)) {
  ?><h1>No athletes registered for <?php echo $competition["name"]; ?></h1><?php
} else {
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

    <h1><?php echo $competition["name"]; ?></h1>
    <div class="table-container">
      <table>
        <tr>
          <th>Name</th>
          <th>Gender</th>
          <th>Age</th>
        </tr>
        <?php foreach ($athletes as $row) {?>
          <tr>
            <td><?php echo $row["name"] ?></td>
            <td><?php echo $row["gender"] ?></td>
            <td><?php echo $row["age"] ?></td>
          </tr>
        <?php } ?>
      </table>
    </div>
  <?php
}