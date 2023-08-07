//import {BACKEND_URL} from "$env/static/private";

export const load = async ({params}) => {
    let tools = []

    if (params.query != null) {

        let target = `${process.env.BACKEND_URL}api/directory/tools/search/?term=${params.query}`;
        let result = await fetch(target)
        tools = await result.json()
        console.log(tools)
    }

    return {
        query: params.query,
        tools: tools
    }
}
