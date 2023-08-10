<script>

    import {page} from "$app/stores";

    export let data;
    let tools = []
    let tags = []
    tools = data.tools
    tags = data.tags


</script>


<div class="row m-3">
    <div class="col-md-1 p-3"></div>
    <div class="col-md-7 p-3">
        <h2 class="text-header-1 text-center">
            دستیار <span class="text-mine-orange">هوش مصنوعی</span> شما
        </h2>
        <br/>
        <h3 class="text-header-2 text-center">
            هرچیزی که از <span class="text-mine-teal">هوش مصنوعی</span> لازم دارید اینجا هست
        </h3>
        <div class="hashtags">
            {#each tags as tag}
                <a class="tag-top" href="/browse/{tag.replace(' ','_')}">#{tag.replace(' ', '_')}</a>
            {/each}
        </div>
    </div>
    <div class="col-md-4 p-3">
        <img src="./images/home.png" alt="" width="450" class="img-fluid "/>
    </div>
</div>




