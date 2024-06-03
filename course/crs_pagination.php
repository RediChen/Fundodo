<?php if (isset($_GET['page'])) : ?>
    <?php $page_now = $_GET['page']; ?>
    <div aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item">
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
                <a class="page-link" href="<?= $link ?>">上一頁</a>
            </li>

            <?php for ($i = 1; $i <= $NUM_PAGES; $i++) : ?>
                <?php
                $linkClass = "page-link"
                    . (($i === $page) ? 'active' : '');
                $link = "?page=$i&order=$order_code"
                    . (isset($_GET['tag_id']) ? '&tag_id=' . $_GET['tag_id'] : '');
                //order_code 取得於 header
                ?>
                <li class="page-item">
                    <a class="<?= $linkClass ?>" href="<?= $link ?>">
                        <?= $i ?>
                    </a>
                </li>
            <?php endfor; ?>

            <li class="page-item">
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
                <a class="page-link" href="<?= $link ?>">下一頁</a>
            </li>
        </ul>
    </div>
<?php endif; ?>