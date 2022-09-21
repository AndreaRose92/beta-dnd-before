import { useEffect, useState } from "react"
import { Link, Outlet } from "react-router-dom"
import { getRequest } from "../tools/FetchTypes"


export const RaceIndex = () => {
    
    const [races, setRaces] = useState([])
    
    useEffect(()=>{getRequest('/races', setRaces)},[])

    const renderRaces = races.map(race => <Link key={race.id} to={`/races/${race.name}`}><button>{race.name}</button></Link>)

    return (
        <div>
            {renderRaces}
            <Outlet />
        </div>
    )
}