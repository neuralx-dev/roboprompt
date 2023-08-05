<script>
    import {page} from "$app/stores";
</script>

<nav class="navbar">
    <div class="col-1"></div>

    <div class="col-2">
        <a class="navbar-brand text-white " href="#">
            <!--<img src="/images/icons8_Pen_100px_1.png" alt="Logo" width="70" height="70"
                 class="d-inline-block align-text-top nav-logo">-->
            تول بات
        </a>
    </div>
    <div class="col-4 d-flex justify-content-center">
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link" href="/browse">جستجو</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">بلاگ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">آموزش</a>
            </li>

            <li class="nav-item">
                <a class="nav-link ">درباره ما</a>
            </li>

        </ul>
    </div>
    <div class="col-2"></div>
    <div class="col-2 text-center ">
            {#if $page.data.userD}
                <a href="/panel" type="button" class="btn btn-base  btn-base-w100 ">پنل کاربری</a>
            {:else}
                <a href="/login" type="button" class="btn btn-base  btn-base-w100 ">ثبت نام / ورود</a>
            {/if}

    </div>
    <div class="col-1"></div>
</nav>
