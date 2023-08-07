//import {BACKEND_URL} from "$env/static/private";

export async function load({params}) {

    //console.log(process.env.BACKEND_URL)
    // Make a GET request to the API endpoint with the query parameter
    const response = await fetch(process.env.BACKEND_URL + 'api/directory/tools/home/');

    // Parse the response as JSON
    const page = await response.json();
    console.log(page.tools)
    return {
        tools: page.tools,
        tags: page.tags,
        count: page.count
    }
}
