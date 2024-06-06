<style>
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap');

    pre {
        padding: 1rem;
        background-color: #002c0d;
        color: #fdfcfa;
        border-radius: 1rem;
        font-family: "IBM Plex Mono", "Helvetica Neue";
        text-align: left;
        overflow-wrap: break-word;
        /* white-space: wrap; */
    }
</style>
<?php
function printArray($array)
{
    echo '<p><pre>';
    print_r($array);
    echo '</pre></p>';
}
function br($times = 1)
{
    for ($i = 0; $i < $times; $i++) {
        echo '<br>';
    }
}
