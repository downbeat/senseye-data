<?php

ini_set ('display_errors', true);

require_once 'Pie.php';

$p = new Pie();
$p->data[] = array ('Wireless Radio (Transmitting)', 227);
$p->data[] = array ('Microcontroller', 56);
$p->data[] = array ('Imaging', 6.4);

$p->draw('png');

# $p->draw('tex');

# --- Other options --- #

# $p->file="";
# $p->title="";
$p->showPercent=false;
# $p->fontFile=".../font.ttf";
$p->fontSize=24;
#$p->imgWidth=950;
#$p->imgHeight=600;
# $p->pdfWidth=;


?>
