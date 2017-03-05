<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="network.php">GarKut</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">CONFIGURATION<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="allowed.php">Allowed</a></li>
            <li><a href="missing.php">Missing</a></li>
            <li><a href="revoked.php">Revoked</a></li>
            <li><a href="spoofed.php">Spoofed</a></li>
          </ul>
        </li>
        <li><a href="about.php">ABOUT</a></li>
	</ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<body>
<div class="container">
<p> These Devices are allowed on your network: </p>
<pre>
<?php
echo "<html><body><table>\n\n";
     echo "<tr>";
	echo "<th>Current IP</th>";
	echo "<th> MAC Address</th>";
	echo "<th> Manufacturer</th>";
	echo "<th> Previous IP</th>";
	echo "<th> Online Devices</th>";
	echo "<th> Offline Devices</th>";
        echo "</tr>\n";
$f = fopen("wn.txt", "r");
while (($line = fgetcsv($f)) !== false) {
	echo "<tr>";        
	foreach ($line as $cell) {
                echo "<td>" . htmlspecialchars($cell) . "</td>";
        }
        echo "</tr>\n";
}
fclose($f);
echo "\n</table></body></html>";
?>
</pre>

<pre>
<div>
<form method="post" action="name.php">
Name Association: <input type="text" name="mac_address" size="35" placeholder="MAC Address"/> <input type="text" name="device_name" size="35" placeholder="Device Name"/>
<input type="submit"/>
</form>
</div>
</pre>

</div>
</body>
</html>
