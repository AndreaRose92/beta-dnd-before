import styled from "styled-components";

const CSHeader = styled.section`
  grid-area: hd;
  display: flex;

  div.CSHeader1 {
    width: 100px;
    height: 100px;
    margin: 5px 15px;
    border-radius: 10px;
    border: 2px outset #d4af37;
    background: radial-gradient(farthest-corner at 5px 5px,
      #fff 0%, #aaa9ad 100%);
    display: flex;
    align-items: center;
    
  }

  div.CSHeader1 > img {
    width: 90px;
    height: 90px;
    border-radius: 10px;
    padding: 5px;
    object-fit: cover;
  }

  div.CSHeader2 {
    margin-left: 25px;
  }

  div.CSHeader2 > div {
    margin-top: 20px;
    display: flex;
  }
`

const StatBox = styled.section`
  margin: 5px 15px;
  border-radius: 10px;
  border: 2px outset #d4af37;
  background: radial-gradient(farthest-corner at 5px 5px,
    #fff 0%, #aaa9ad 100%);
  display: flex;
  justify-content: center;

  div {
    display: grid;
    grid-template-rows: 1fr 1fr 1fr;
    width: 100px;
    height: 30px;
    text-align: center;
  }

  .mid {
    display: inline-flex;
    justify-content: center;
    align-items: center;
  }

  .bottom {
    padding-top: 10px;
  }
  
`

const AuxiliaryBox = styled.section`
  margin: 5px;
  border-radius: 10px;
  border: 2px outset #d4af37;
  background: radial-gradient(farthest-corner at 5px 5px,
    #fff 0%, #aaa9ad 100%);
  display: flex;
  justify-content: center;

  div {
    display: grid;
    grid-template-rows: 1fr 1fr 1fr;
    width: 100px;
    height: 30px;
    text-align: center;
  }

  .mid {
    display: inline-flex;
    justify-content: center;
    align-items: center;
  }

  .bottom {
    padding-top: 10px;
  }
`

const InspirationBox = styled.section`
  grid-area: in;
  margin: 5px;
  
  div {
    display: grid;
    grid-template-rows: 1fr 1fr;
    width: 100px;
    height: 50px;
    text-align: center;
  }

  .inspiration-box {
    border-radius: 10px;
    border: 2px outset #d4af37;
  background: radial-gradient(farthest-corner at 5px 5px,
    #fff 0%, #aaa9ad 100%);
    height: 60px;
    width: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .bottom {
    padding-top: 12px;
  }
`

const HealthBox = styled.section`
  grid-area: hb;
  margin: 5px;
  border-radius: 10px;
  border: 2px outset #d4af37;
  background: radial-gradient(farthest-corner at 5px 5px,
    #fff 0%, #aaa9ad 100%);
  /* display: inline-flex;
  flex-direction: row;
  justify-content: center; */
  display:grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;

  div {
    display: grid;
    justify-items: center;
    grid-template-rows: 30px 30px 30px;
    width: 100px;
    height: 30px;
    text-align: center;
    white-space: nowrap;
  }

  div.heal-buttons {
    align-items: center;
  }

  .mid {
    display: inline-flex;
    justify-content: center;
    align-items: center;
  }

  .bottom {
    padding-top: 10px;
  }
`

const SavingThrow = styled.section`
  grid-area: st;
  margin: 5px 15px;
  border-radius: 10px;
  border: 2px outset #d4af37;
  background: radial-gradient(farthest-corner at 30px 30px,
    #fff 0%, #aaa9ad 100%);
  display: flex;

  div {
    width: 300px;
    height: auto;
    text-align: center;
    margin-left: 10px;
  }

  .top {
    
    padding-top: 5px;
    height: 60%;
    display: grid;
    grid-template-columns: 30px 120px 30px 120px;
    grid-template-rows: repeat(3, 1fr);
  }

  .bottom {
    display: flex;
    justify-content: center;
    padding-top: 30px;
  }

  div > div {
    display: flex;
    align-items: center;
    justify-content: left;
  }
`

const SensesBox = styled.section`
  grid-area: sn;
  margin: 5px 15px;
  border-radius: 10px;
  border: 2px outset #d4af37;
  background: radial-gradient(farthest-corner at 30px 30px,
    #fff 0%, #aaa9ad 100%);
  display:grid;
  grid-template-rows: 40px 50px;
  padding:20px;
`

const ProficiencyBox = styled.section`
  grid-area: pb;
  margin: 5px 15px;
  padding: 5px 10px;
  border-radius: 10px;
  border: 2px outset #d4af37;
  background: radial-gradient(farthest-corner at 30px 30px,
    #fff 0%, #aaa9ad 100%);

  .pro-header {
    display: grid;
    height: 30px;
    grid-template-columns: 50px 70px 130px 50px;
    grid-template-rows: 1fr;
    align-items: center;
    text-align: center;
  }

  .skill {
    padding-left: 5px;
    text-align: left;
  }

  .pro-grid {
    display: grid;
    height: 30px;
    grid-template-columns: 50px 70px 130px 50px;
    grid-template-rows: 1fr;
    align-items: center;
    text-align: center;
  }
`

const InitiativeBox = styled.section`
  grid-area: it;
  margin: 5px;

  div {
    display: grid;
    grid-template-rows: 20px 60px 20px;
    width: 100px;
    text-align: center;
  }  

  .mid {
    border-radius: 10px;
    border: 2px outset #d4af37;
  background: radial-gradient(farthest-corner at 5px 5px,
    #fff 0%, #aaa9ad 100%);
    height: 50px;
    width: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
`

const ArmorClass = styled.section`
  grid-area: ac;
  margin: 5px;
  border-radius: 10px;
  border: 2px outset #d4af37;
  background: radial-gradient(farthest-corner at 5px 5px,
    #fff 0%, #aaa9ad 100%);

  div {
    display: grid;
    grid-template-rows: 30px;
    width: 90px;
    text-align: center;
  }

  .top {
    display: flex;
    align-items: flex-end;
    justify-content: center;
  }

  .mid {
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .bottom {
    display: flex;
    align-items: flex-start;
    justify-content: center;
  }
`

const DefensesConditions = styled.section`
  grid-area: dc;
  margin: 5px;
  border-radius: 10px;
  border: 2px outset #d4af37;
  background: radial-gradient(farthest-corner at 5px 5px,
    #fff 0%, #aaa9ad 100%);

  display: grid;
  grid-template-columns: 1fr 1fr;
  padding: 2px 10px;
`

const EquipmentBox = styled.section`
  grid-area: eb;
  margin: 5px;
  padding: 5px 10px;
  border-radius: 10px;
  border: 2px outset #d4af37;
  background: radial-gradient(farthest-corner at 40px 40px,
    #fff 0%, #aaa9ad 100%);

  .eq-box-header {
    display: flex;
    width: 400px;
    justify-content: space-evenly;
    margin-right: 20px;
  }
`

const EquipmentWrap = styled.nav`
  height: 300px;
  overflow-y: auto;
  
  ::-webkit-scrollbar {
    background-color: #141311;
  }

  ::-webkit-scrollbar-track {
  background: #aaa9ad;
}

::-webkit-scrollbar-thumb {
  background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #d4af37 100%);;
  border: 2px ridge #d4af37;
}

  .eq-header {
    display: grid;
    height: 30px;
    grid-template-columns: 50px 150px 80px 50px 300px;
    grid-template-rows: 1fr;
    align-items: center;
    text-align: center;
  }

  .eq-grid {
    display: grid;
    height: 30px;
    grid-template-columns: 50px 150px 80px 50px 300px;
    grid-template-rows: 1fr;
    align-items: center;
    text-align: center;
  }

  .eq-grid > div.spell-desc {
    padding: 10px;
  overflow: hidden;
  white-space: nowrap;

  text-overflow: ellipsis;
  }

  .eq-grid > div.spell-desc:hover {
    border: 2px ridge #d4af37;
    background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #d4af37 100%);
    overflow: visible;
    white-space: normal;
  }
`

export {StatBox, CSHeader, AuxiliaryBox, InspirationBox, HealthBox, SavingThrow, ProficiencyBox, EquipmentBox, EquipmentWrap, SensesBox, ArmorClass, DefensesConditions, InitiativeBox}