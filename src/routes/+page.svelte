<script>

    import Prompt from "$lib/wids/Prompt.svelte";
    import {page} from "$app/stores";

    export let data;
    let prompts = []
    let tags = []
    prompts = data.prompts
    tags = data.tags
    let query = ''

    const search = async () => {
        let res = await fetch($page.data.baseApiUrl + 'api/roboprompt/prompts/search/?q=' + query)
        prompts = await res.json()
    }


</script>

<div class="row">
    <h2 class="text-header-1 text-center col-12 col-md-12 col-sm-12">
        قدرت <span class="text-mine-orange"> هوش مصنوعی </span> در <span class="text-mine-teal"> خدمت </span>شما
    </h2>
</div>
<div class="row m-3">
    <div class="col-md-1 p-3"></div>
    <div class="col-md-7 p-3">

        <br/>
        <h3 class="text-header-2 ">
            پرامپت مورد نیاز را <span class="text-mine-teal"> جستجو </span> کنید،<span
                class="text-mine-pink">آزمایش </span> کنید، اگر کار کرد<span class="text-mine-orange"> لایک </span>کنید
        </h3>
        <form on:submit|preventDefault={search}>

            <div class="row search-div d-flex">
                <button on:keydown={search} type="submit" class="col-2 search-icon"><i class="bi bi-search"></i>
                </button>
                <input bind:value={query} type="text" name="" id="" class="search-input col-8"
                       placeholder="جستجو در توضیحات ، تیتر یا خود پرامپت">
                <div class="btn-group col-2 mb-1" role="group" aria-label="Basic radio toggle button group ">
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                    <label class="btn btn-outline-secondary right-rounded" for="btnradio1">
                        <img src="/images/ChatGPT_100px.png" width="30"
                             alt="chatgpt">
                    </label>

                    <input type="radio" class="btn-check" name="btnradio" id="btnradio3"
                           autocomplete="off">
                    <label class="btn btn-outline-secondary left-rounded" for="btnradio3">
                        <img src="/images/Camera_100px.png" width="30"
                             alt="midjourney">

                    </label>
                </div>

            </div>
        </form>

    </div>
    <div class="col-md-4 p-3">
        <img src="./images/robot-home.png" alt="" width="450" class="img-fluid robot-white-shadow"/>
    </div>
</div>

<div class="row">

    {#each prompts as i}
        <Prompt prompt={i}/>
    {/each}
</div>


