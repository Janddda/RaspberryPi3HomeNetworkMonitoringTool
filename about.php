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
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="network.php">GarKut</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">CONFIGURATION<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="network.php">Allowed</a></li>
            <li><a href="missing.php">Missing</a></li>
            <li><a href="revoked.php">Revoked</a></li>
            <li><a href="dup3.txt">Spoofed</a></li>
          </ul>
        </li>
        <li><a href="about.php">ABOUT</a></li>
	</ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<body>
<div class="container">
<p> Raspberry Pi 3 Home Network Monitoring Tool <br> By: Garen Kutukian <br> What is this: Master's Thesis Project, Computer Science, Cal Poly Pomona. <br> This tool was created to easily detect free riders on your home network and be able to kick them off without logging on to the router. <br> It was made to be running on a Raspberry Pi with Kali Linux but can be installed on any Linux distribution with the correct dependencies installed.</p>
</div>
</body>
</html>
