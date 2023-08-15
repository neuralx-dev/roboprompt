<script lang='ts'>


    import {page} from "$app/stores";

    let promptObject = {
        creator: $page.data.userD.id
    }

    const submit = async () => {
        const response = await fetch($page.data.baseApiUrl + '/api/roboprompt/prompts/create/', {
            method: 'POST',
            headers: {
                'Authorization':'Bearer '+$page.data.userD.token,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(promptObject)
        });

        // Handle the response from the backend
        if (response.ok) {
            // If the response status is 200, show a success message
            alert('Prompt created successfully!');
        } else {
            // If the response status is not 200, show an error message
            alert('Something went wrong. Please try again.');
        }
    }

</script>


<!-- Bootstrap 5 form for Prompt model -->
<div class="row">
    <div class="col-4"></div>
    <div class="col-8 right-border">
        <form id="prompt-form" class="container">
            <div class="mb-3">
                <label for="title" class="form-label">عنوان پرامپت</label>
                <input bind:value={promptObject['title']} type="text" class="form-control" id="title" name="title"
                       maxlength="250" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">توضیحات</label>
                <textarea bind:value={promptObject['description']} class="form-control" id="description"
                          name="description" rows="3" required></textarea>
            </div>
            <div class="mb-3">
                <label for="command" class="form-label">پرامپت</label>
                <textarea bind:value={promptObject['command']} class="form-control" id="command" name="command" rows="3"
                          required></textarea>
            </div>
            <div class="mb-3">
                <label for="language" class="form-label">زبان</label>
                <select bind:value={promptObject['language']} class="form-select" id="language" name="language"
                        required>
                    <option value="Persian">فارسی</option>
                    <option value="English">English</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="ai_type" class="form-label">نوع فرمان</label>
                <select bind:value={promptObject['ai_type']} class="form-select" id="ai_type" name="ai_type" required>
                    <option value="text">Text</option>
                    <option value="image">Image</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="tags" class="form-label">هشتگ های پرامپت ، با # جدا کنید</label>
                <input bind:value={promptObject['tags']} type="text" class="form-control" id="tags" name="tags"
                       maxlength="250">
            </div>
            <button type="submit" class="btn btn-primary btn-base-w100" on:click={submit}>
                ارسال
            </button>
        </form>
    </div>
</div>

<!-- Svelte script to handle form submission and fetch data -->

