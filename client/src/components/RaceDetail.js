import { useEffect, useState } from "react"
import { useParams } from "react-router-dom"
import { getRequest } from "./tools/FetchTypes"
import { NavButton } from "./tools/Hooks"

export const RaceDetail = () => {

    const params = useParams()
    const [race, setRace] = useState({})

    useEffect(()=>{getRequest(`/races/${params.race}`, setRace)}, [params.race])

    return (
        <div>
            <h4>{race.name}</h4>
            <NavButton />
        </div>
    )

}