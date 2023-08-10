import {env} from "$env/dynamic/public";

export async function load({params}) {

    //console.log(process.env.BACKEND_URL)
    // Make a GET request to the API endpoint with the query parameter
    console.log(env.PUBLIC_BACKEND_URL)
    const response = await fetch(env.PUBLIC_BACKEND_URL + 'api/directory/tools/home/');

    // Parse the response as JSON
    const page = await response.json();
    console.log(page.tools)
    return {
        tools: page.tools,
        tags: page.tags,
        count: page.count
    }
}
