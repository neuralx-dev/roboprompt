<script>

    import {page} from "$app/stores";

    export let data;
    let tools = []
    let tags = []
    tools = data.tools
    tags = data.tags
    console.log(data.tags)


    const like = async (id) => {

        let res = await fetch(`${import.meta.env.VITE_BACKEND_URL}api/directory/tools/like/${id}/`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ' + $page.data.userD.token
            },
            body: JSON.stringify({
                tool_id: id
            })
        })
        if (res.status === 201) {
            alert('liked 🤗')
        }
        if (res.status === 406) {
            alert('unliked 🤭')
        }

        console.log(await res.json())
    }

</script>


<div class="row m-3">
    <div class="col-md-1 p-3"></div>
    <div class="col-md-7 p-3">
        <h2 class="text-header-1 text-center">
            دستیار <span class="text-mine-orange">هوش مصنوعی</span> شما
        </h2>
        <br />
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
        <img src="./images/home.png" alt="" width="450" class="img-fluid " />
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

        <div class="col-lg-3 col-sm-12 col-md-6">
            <div class="tool-box" on:click={()=>{like(i.id)}}>
                <img alt="" class="tool-image" src="http://127.0.0.1:8000/{i.banner}"/>

                <div class="tool-title">
                    <h4 class="col-md-10">{i.name}</h4>
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
