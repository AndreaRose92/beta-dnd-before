import { SensesBox } from "../../styles";

export const Traits = ({ race }) => {
    if (race.languages === null) {
      return (
        <SensesBox>
          <h3>Race Data Not Found</h3>
        </SensesBox>
      );
    }
  
    return (
      <SensesBox>
        <p>LANGUAGES</p>
        <h3>{race.languages}</h3>
        <p>TRAITS</p>
        <h3>
          {race.traits}
        </h3>
      </SensesBox>
    );
  };
  