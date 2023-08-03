import {BACKEND_URL} from "$env/static/private";

export async function load({params}){


    // Make a GET request to the API endpoint with the query parameter
    const response = await fetch(BACKEND_URL+'directory/tools/home');

    // Parse the response as JSON
    const tools = await response.json();
    return {
        tools
    }
}
