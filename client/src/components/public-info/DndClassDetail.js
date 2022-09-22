import { useEffect, useState } from "react"
import { Outlet, useParams } from "react-router-dom"
import LevelDetail from "./LevelDetail"
import { getRequest } from "../tools/FetchTypes"
import { NavButton } from "../tools/Hooks"

export const DndClassDetail = (dnd_class) => {

    const params = useParams()
    const [dndClass, setDndClass] = useState({})
    const [dndClassLevels, setDndClassLevels] = useState([])

    useEffect(()=>{getRequest(`/dnd_classes/${params.dnd_class}`, setDndClass)}, [params.dnd_class])
    useEffect(()=>{getRequest(`/${params.dnd_class.toLowerCase()}_levels`, setDndClassLevels)}, [params.dnd_class])

    const renderLevels = dndClassLevels.map(cl => {
        return (
            <div key={cl.level}>
                <h2>Level {cl.level}</h2>
                <NavButton path={`/${params.dnd_class.toLowerCase()}/${cl.level}`} text={"More Detail"} ><LevelDetail /></NavButton>
            </div>
        )
    })

    return (
        <div>
            <h4>{dnd_class.name}</h4>
            <NavButton path={'/dnd_classes'}/>
            {renderLevels}
            <Outlet />
        </div>
    )

}