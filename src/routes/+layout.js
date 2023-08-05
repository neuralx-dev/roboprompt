import {browser} from "$app/environment";

export const load = async ({data}) => {


    let userD;
    if(browser){
        const dataString = localStorage.getItem("userData");

        userD = JSON.parse(dataString);
    }else {
        userD = {}
    }

    return {
        userD
    }

}
