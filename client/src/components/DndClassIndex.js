import { useEffect, useState } from "react"
import { Outlet } from "react-router-dom"
import { getRequest } from "./tools/FetchTypes"
import { NavButton } from "./tools/Hooks"

export const DndClassIndex = () => {
    
    const [classes, setClasses] = useState([])
    
    useEffect(()=>{getRequest('/dnd_classes', setClasses)},[])

    const renderClasses = classes.map(c => <NavButton key={c.id} path={`/${c.name.toLowerCase()}`} text={c.name}/>)

    return (
        <div>
            {renderClasses}
            <Outlet />
        </div>
    )
}