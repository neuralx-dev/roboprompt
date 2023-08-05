<script>
    export let data;
    let tools = []
    let tags = []
    tools = data.tools
    tags = data.tags
    console.log(data.tags)
</script>


<div class="row">
    <div class="col-1"></div>
    <div class="col-7">
        <h2 class="text-header-1">
            دستیار <span class="text-mine-orange">هوش مصنوعی</span> شما
        </h2><br>
        <h3 class="text-header-2">
            هرچیزی که از <span class="text-mine-teal">هوش مصنوعی</span> لازم دارید اینجا هست
        </h3>
        <div class="hashtags">
            {#each tags as tag}
                <a class="tag-top" href="/browse/{tag.replace(' ','_')}">#{tag.replace(' ','_')}</a>
            {/each}
        </div>
    </div>
    <div class="col-3">
        <img src="./images/home.png" alt="" width="450">
    </div>
</div>


<div class="row">
    <div class="col-2"></div>
    <div class="col-8">
        <div class="searchbar">
            <input class="search-input" type="text" name=""
                   placeholder="جستجو در بین {data.count} ابزار هوش مصنوعی کاربردی برای کسب و کار ...">
            <a href="#" class="search-icon"><i class="bi bi-search"></i></a>
        </div>
    </div>
    <div class="col-2"></div>
</div>
<div class="row">
    {#each tools as i}

        <div class="col-3">
            <div class="tool-box">
                <img alt="" class="tool-image" src="http://127.0.0.1:8000/{i.banner}"/>

                <div class="tool-title">
                    <h3>{i.name}</h3>
                </div>
                <div class="tool-short">
                    <p>
                        {i.about}
                    </p>
                </div>
                <div class="tool-tags">
                    <p>

                        {#each i.tags.split(',') as t}
                            <span class="tag">#{t.replace(' ', '_')}</span>
                        {/each}
                    </p>
                </div>
            </div>
        </div>
    {/each}

</div>
