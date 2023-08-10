<script>
    import {page} from "$app/stores";
    import {goto} from "$app/navigation";

    export let tool

    const like = async (id) => {

        if($page.data.userD){
            let res = await fetch(`${$page.data.baseApiUrl}api/directory/tools/like/${id}/`, {
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
        }else {
            goto('/login')
        }

        //console.log(await res.json())
    }

</script>
<div class="col-lg-3 col-sm-12 col-md-6">
    <div class="tool-box" on:click={()=>{like(tool.id)}}>
        <img alt="" class="tool-image" src="{$page.data.baseApiUrl}{tool.banner}"/>

        <div class="tool-title">
            <h4 class="col-md-10">{tool.name}</h4>
        </div>
        <div class="tool-short">
            <p>
                {tool.about}
            </p>
        </div>
        <div class="tool-tags">
            <p>

                {#each tool.tags.split(',') as t}
                    <span class="tag">#{t.replace(' ', '_')}</span>
                {/each}
            </p>
        </div>
    </div>
</div>
