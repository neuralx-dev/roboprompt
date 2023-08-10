<script>
    import Tool from "$lib/wids/Tool.svelte";

    //const url = import.meta.env.VITE_BACKEND_URL;
    let url = 'https://baseplate.iran.liara.run/'

    export let data

    let tools = data.tools

    let term = ''


    const search = async () => {
        let target = `${url}api/directory/tools/search/?term=${term}`;
        //console.log(target)
        let result = await fetch(target)
        tools = await result.json()

    }

    /*const like = async (id) => {

        let res = await fetch(`${url}api/directory/tools/like/${id}/`, {
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
    }*/


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

        <Tool tool={i}/>
    {/each}

</div>
