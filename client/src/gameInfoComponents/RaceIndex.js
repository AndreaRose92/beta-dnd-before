import { NavButton, races } from "../hookComponents"
import { RaceDetail } from "./"

export const RaceIndex = () => {

    const renderRaces = races.map(r => <NavButton key={r} path={`/races/${r.toLowerCase()}`} text={r}><RaceDetail /></NavButton>)

    return (
        <div>
            {renderRaces}
            <NavButton />
        </div>
    )
}