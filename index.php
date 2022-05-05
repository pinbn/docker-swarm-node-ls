<?php
$result = null;
exec('/usr/local/bin/docker node ls', $result);
$ok = true;
foreach($result as $line) {
    if (stripos($line,"DOWN") === true) {
        $ok = false;
        echo "<div class=\"red\"><pre class=\"red\">" . $line . "</pre></div>";
    } else {
        echo "<div><pre>" . $line . "</pre></div>";
    }
}
?>
<html><body>
<style>
  div, pre { margin: 0px !important; background-color: black; color: white; }
  .red { background-color: red; color: white; font-weight: bolder; }
  html, body {
  <?php 
    if ($ok) echo "background-color: black; color: white;";
    else echo "background-color: red; color: white; font-weight: bolder;";
  ?>
  }
</style>
</body></html>