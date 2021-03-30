<?php
    $res = '<link rel="stylesheet" href="style.css"><form action="index.html"><h1>Submitted Information</h1>';
    foreach($_POST as $key=>$val){
        $res .= '<span>' . ucwords(str_replace("_"," ",$key)) . '</span>:&nbsp;<span>' . ucwords($val) . '</span>';
    }
    $res .= '<input type="submit" value="Return"></form>';
    echo $res;
?>