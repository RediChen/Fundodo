<?php if (isset($_GET['page'])) : ?>
    <?php $page_now = $_GET['page']; ?>
    <div aria-label="Page navigation">
        <ul class="pagination-fdd">
            <li class="item">
                <?php
                if ($page_now == 1) :
                    $link = "#";
                else :
                    $link = "?page=" . ($page_now - 1)
                        . "&order=$order_code"
                        . (isset($_GET['tag_id']) ? '&tag_id=' . $_GET['tag_id'] : '');
                //order_code 取得於 header
                endif;
                ?>
                <a class="link fx-center" href="<?= $link ?>"><i class="fa-solid fa-angle-left"></i></a>
            </li>

            <?php for ($i = 1; $i <= $NUM_PAGES; $i++) : ?>
                <?php
                $linkClass = "link"
                    . (($i == $page_now) ? ' active' : '');
                $link = "?page=$i&order=$order_code"
                    . (isset($_GET['tag_id']) ? '&tag_id=' . $_GET['tag_id'] : '');
                //order_code 取得於 header
                ?>
                <li class="item">
                    <a class="<?= $linkClass ?>" href="<?= $link ?>">
                        <?= $i ?>
                    </a>
                </li>
            <?php endfor; ?>

            <li class="item">
            <?php
                if($page_now == $NUM_PAGES):
                    $link = "#";
                else:
                $link = "?page=" . ($page_now + 1)
                    . "&order=$order_code"
                    . (isset($_GET['tag_id']) ? '&tag_id=' . $_GET['tag_id'] : '');
                //order_code 取得於 header
                endif;
                ?>
                <a class="link fx-center" href="<?= $link ?>"><i class="fa-solid fa-angle-right"></i></a>
            </li>
        </ul>
    </div>
<?php endif; ?>