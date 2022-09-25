import { NavButton } from "../hookComponents/Hooks"
import { RaceDetail } from "./RaceDetail"
import { races } from '../hookComponents/miscData'

export const RaceIndex = () => {

    const renderRaces = races.map(r => <NavButton key={r} path={`/races/${r.toLowerCase()}`} text={r}><RaceDetail /></NavButton>)

    return (
        <div>
            {renderRaces}
            <NavButton />
        </div>
    )
}