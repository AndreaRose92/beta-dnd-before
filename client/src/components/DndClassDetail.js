import { useEffect, useState } from "react"
import { useParams } from "react-router-dom"
import { getRequest } from "./tools/FetchTypes"
import { NavButton } from "./tools/Hooks"

export const DndClassDetail = () => {

    const params = useParams()
    const [dndClass, setDndClass] = useState({})
    const [dndClassLevels, setDndClassLevels] = useState([])

    useEffect(()=>{getRequest(`/dnd_classes/${params.dnd_class}`, setDndClass)}, [params.dndClass])
    useEffect(()=>{getRequest(`/${params.dnd_class.toLowerCase()}s`, setDndClassLevels)}, [params.dnd_class])

    const renderLevels = dndClassLevels.map(cl => {
        const features = cl.features.map(f=>{
            return (
                <li>{f.name}</li>
            )
        })
        return (
            <div>
                <h2>Level {cl.level}</h2>
                <p>ABI: {cl.ability_score_bonuses}</p>
                <p>Proficiency Bonus: {cl.prof_bonus}</p>
                <h3>Features</h3>
                <ul>{features}</ul>
            </div>
        )
    })
    
    return (
        <div>
            <h4>{dndClass.name}</h4>
            <NavButton path={'/dnd_classes'}/>
            {renderLevels}
        </div>
    )

}