import { SensesBox } from "../../styles/CharacterSheetGrids.style";

export const Traits = ({ character }) => {
    if (character.race.languages === null) {
      return (
        <SensesBox>
          <h3>Race Data Not Found</h3>
        </SensesBox>
      );
    }
  
    return (
      <SensesBox>
        <p>LANGUAGES</p>
        <h3>{character.race.languages.replace(/[\]"]+/g, '')}</h3>
        <p>TRAITS</p>
        <h3>
          {character.race.traits.replace(/[\]"]+/g, '').replace(/[,]/g, '\n')}
        </h3>
      </SensesBox>
    );
  };
  