import { useEffect, useState } from "react"
import { Outlet, useParams } from "react-router-dom"
import LevelDetail from "./LevelDetail"
import { getRequest } from "../tools/FetchTypes"
import { NavButton } from "../tools/Hooks"
import { TitleCard } from "../styles/Details.style"

export const DndClassDetail = () => {

    const params = useParams()
    const [dndClass, setDndClass] = useState({})
    // const [dndClassLevels, setDndClassLevels] = useState([])
    const dndClassLevels = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

    useEffect(()=>{getRequest(`/dnd_classes/${params.dnd_class}`, setDndClass)}, [params.dnd_class])
    // useEffect(()=>{getRequest(`/dnd_class_levels/${params.dnd_class}`, setDndClassLevels)}, [params.dnd_class])

    const renderLevels = dndClassLevels.map(level => {
        return (
            <div key={level}>
                <h2>Level {level}</h2>
                <NavButton path={`/${params.dnd_class}/${level}`} text={"More Detail"}><LevelDetail/></NavButton>
            </div>
        )
    })

    console.log(dndClass)

    if (!dndClass) {
        return (
            <div>Loading...</div>
        )
    }

    return (
        <TitleCard>
            <h1>{dndClass.name}</h1>
            <ul>
                <li>Hit Die: 1d{dndClass.hit_die}</li>
                <li>Recommended Top Stat: {dndClass.recommended_stat_one}</li>
                <li>Recommended Second Stat: {dndClass.recommended_stat_two}</li>
            </ul>
            <NavButton path={'/dnd_classes'}/>
            {renderLevels}
            <Outlet />
        </TitleCard>
    )

}