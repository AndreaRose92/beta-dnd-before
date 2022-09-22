
export const postRequest = (url, postObject, respFunc) => {
    fetch(url, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(postObject)
    }).then(r=>{
        if (r.ok) {
            r.json().then(data=>respFunc(data))
        } else {
            r.json().then(error=>console.log(error))
        }
    })
}

export const deleteRequest = (url, target, respFunc) => {
    fetch(url, {method: "DELETE"}).then(()=>respFunc(state => state.filter(elem => elem.id !== target)))
}

export const getRequest = (url, respFunc) => {
    fetch(url).then(r=>{
        if (r.ok) {
            r.json().then(data=>respFunc(data))
        } else {
            r.json().then(error=>console.log(error))
        }
    })
}