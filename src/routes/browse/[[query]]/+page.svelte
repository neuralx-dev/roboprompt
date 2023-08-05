<script>
    const url = import.meta.env.VITE_BACKEND_URL;
    export let data

    let tools = data.tools

    let term = ''


    const search = async () => {
        let target = `${url}directory/tools/search/?term=${term}`;
        let result = await fetch(target)
        tools = await result.json()

    }

</script>

<div class="row">
    <div class="col-2"></div>
    <div class="col-8">
        <form on:submit|preventDefault={search}>
            <div class="searchbar">
                <input class="search-input" type="text" name="" bind:value={term}
                       placeholder="جستجو در بین 3000 ابزار هوش مصنوعی کاربردی برای کسب و کار ...">
                <a href="#" class="search-icon" on:click={search}><i class="bi bi-search"></i></a>
            </div>
        </form>
    </div>
    <div class="col-2"></div>
</div>
<div class="row">
    {#each tools as i}

        <div class="col-lg-3 col-sm-12 col-md-6">
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
