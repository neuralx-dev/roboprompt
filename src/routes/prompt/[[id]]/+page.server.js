import {env} from "$env/dynamic/public";


export async function load({params}) {
    //console.log(process.env.BACKEND_URL)
    // Make a GET request to the API endpoint with the query parameter
    console.log(env.PUBLIC_BACKEND_URL)
    const response = await fetch(env.PUBLIC_BACKEND_URL + `api/roboprompt/prompts/view/${params.id}/`);

    // Parse the response as JSON
    const prompt = await response.json();
    //console.log(page.tools)
    return {
        prompt
    }
}
