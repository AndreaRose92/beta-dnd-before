import { useEffect, useState } from "react"
import { useParams } from "react-router-dom"
import { getRequest } from "./tools/FetchTypes"
import { NavButton } from "./tools/Hooks"

export const DndClassDetail = () => {

    const params = useParams()
    const [dndClass, setDndClass] = useState({})

    useEffect(()=>{getRequest(`/dnd_classes/${params.dnd_class}`, setDndClass)}, [params.dnd_class])

    console.log(dndClass)

    return (
        <div>
            <h4>{dndClass.name}</h4>
            <NavButton />
        </div>
    )

}