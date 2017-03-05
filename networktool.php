<!DOCTYPE html>
<html> 
<p> These Devices are allowed on your network </p>
<div>
<iframe id="myFrame" src="master.txt" frameBorder='0' width='500'></iframe>
</div>
<p> These Devices are not in your network database </p>
<div>
<iframe id="myFrame" src="missing.txt" frameBorder='0' width='500'></iframe>
</div>
<div>
<form method="post" action="revoke.php">
Revoke Device: <input type="text" name="mac_address_revoke" size="35" placeholder="MAC Address"/>
<input type="submit"/>
</form>
<form method="post" action="add.php">
Allow Device:  <input type="text" name="mac_address_allow" size="35" placeholder="MAC Address"/>
<input type="submit"/>
</form>
</div>
<p> These Devices are revoked from your network </p>
<div>
<iframe id="myFrame" src="revoked.txt" frameBorder='0' width='500' ></iframe>
</div>
<p> These MAC addresses are being spoofed on your network </p>
<div>
<iframe id="myFrame" src="dup3.txt" frameBorder='0' width='500' ></iframe>
</div>
</html>

