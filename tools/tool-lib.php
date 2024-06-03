<?php
function printSess()
{
    if (isset($_SESSION['user'])) :
        printArray($_SESSION);
    else :
        echo '<br>沒有 session<br>';
    endif;
}

function leadTo($path)
{
    header("Location: $path");
}
