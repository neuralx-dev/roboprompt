<script>

    import {page} from "$app/stores";
    import {goto} from "$app/navigation";

    export let data


    let comment = ''

    let prompt = data.prompt
    //console.log($page.data.baseApiUrl)
    const like = async (id) => {
        if (!$page.data.userD) {
            await goto('/login')
        }
        let res = await fetch(`${$page.data.baseApiUrl}api/roboprompt/prompts/like/${id}/`, {
            method: 'POST',
            headers: {
                'Authorization': 'Bearer ' + $page.data.userD.token
            },
        })
        if (res.status === 201) {
            alert('liked')
            await updateThisPrompt()
        } else if (res.status === 406) {
            alert('unliked')
            await updateThisPrompt()
        }
    }

    const commentPrompt = async () => {
        if (!$page.data.userD) {
            await goto('/login')
        }
        let res = await fetch(`${$page.data.baseApiUrl}api/roboprompt/prompts/comment/${prompt.id}/`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ' + $page.data.userD.token
            },
            body: JSON.stringify({
                'content': comment
            })
        })
        if (res.status === 201) {
            //alert('liked')
            await updateThisPrompt()
        } else if (res.status === 406) {
            //alert('unliked')
            await updateThisPrompt()
        }
    }

    const updateThisPrompt = async () => {
        const response = await fetch($page.data.baseApiUrl + `api/roboprompt/prompts/view/${prompt.id}/`);
        prompt = await response.json()
    }

    const copy = () => {
        navigator.clipboard.writeText(prompt.command)
        alert('کپی شد')
    }

</script>


<div class="row">

    <div class="col-4">
        <div class="d-grid">
            <button type="button" on:click={copy} class="btn btn-outline-info mb-1">کپی و رفتن به ChatGPT <i
                    class="bi bi-clipboard mx-2"
                    style="color:rgb(13, 202, 240)"></i>
            </button>
            <button on:click={()=>like(prompt.id)} type="button" class="btn btn-outline-primary mt-1 mb-2">لایک
                ({prompt.like_count}) <i
                        class="bi bi-heart mx-2"
                        style="color: #EA0B8C"></i>
            </button>
        </div>

        <div class="row search-div d-flex">
            <button on:click={commentPrompt} type="submit" class="col-1 search-icon"><i class="bi bi-send"></i></button>
            <input type="text" name="" id="" class="search-input col-11 comment-input" bind:value={comment}
                   placeholder="نظر شما در مورد این پرامپت ...">

        </div>

        {#if prompt.comments.length > 0}
            {#each prompt.comments as comment}
                <div class="comment-item-right-border">
                    <p><b>{comment.user.email.split('@')[0]}</b></p>
                    <p>{comment.content}</p>
                </div>
            {/each}
        {/if}
    </div>
    <div class="col-8 right-border ltr">
        <div class="prompt">
            <div class="prompt-props" style="direction: rtl !important">
                <a href="#" on:click={copy}><i class="bi bi-clipboard"></i></a>

                <span></span>


            </div>
            <div class="prompt-command ">
                <p class="ltr">
                    {prompt.command}
                </p>
            </div>
        </div>

        <div class="prompt-title my-5">
            <h3>{prompt.title}</h3>
        </div>
        <div class="prompt-title my-5">
            <p class="">
                {@html prompt.description}
            </p>
        </div>
    </div>
</div>
