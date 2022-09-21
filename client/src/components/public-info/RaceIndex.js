import { useEffect, useState } from "react"
import { Link, Outlet } from "react-router-dom"
import { getRequest } from "../tools/FetchTypes"
import { NavButton } from "../tools/Hooks"
import { RaceDetail } from "./RaceDetail"


export const RaceIndex = () => {
    
    // const [races, setRaces] = useState([])
    
    // useEffect(()=>{getRequest('/races', setRaces)},[])

    const races = ["Dragonborn", "Dwarf", "Elf", "Gnome", "Half-Elf", "Half-Orc", "Halfling", "Human", "Tiefling"]

    const renderRaces = races.map(r => <NavButton key={r} path={`/races/${r.toLowerCase()}`} text={r}><RaceDetail /></NavButton>)

    return (
        <div>
            {renderRaces}
            <NavButton />
        </div>
    )
}