<script>
    export let prompt
</script>

<div class=" col-lg-4 col-md-6 col-sm-12  p-1">
    <a href="/prompt/{prompt.id}">
        <div class="prompt {prompt.language === 'English'?'ltr':'rtl'}">
            <div class="prompt-props " style="direction: ltr!important;">
                <div class="d-flex ">
                    <img src="/images/love_100px.png" alt="" width="30" height="30" class="">
                    <span class="mx-2">{prompt.like_count}</span>
                </div>

                <img src={prompt.ai_type==='text'?'/images/ChatGPT_100px.png':'/images/Camera_100px.png'} alt=""
                     width="30" height="30" class="">
            </div>
            <div class="row justify-content-center my-2">
                <div class="col-auto">
                    <h4>{prompt.title}</h4>
                </div>
            </div>
            <div class="prompt-desc ">
                <p class="ltr">
                    {prompt.description.substring(0, 100)}
                </p>
            </div>
            <p class="ltr" style="direction: ltr!important;">@{prompt.creator.email.split('@')[0]}</p>

        </div>
    </a>
</div>
