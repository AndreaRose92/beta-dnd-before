import styled from "styled-components";

const Input = styled.input`
  height: 30px;
  width: 75px;
  border: 2px ridge #d4af37;
  background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #aaa9ad 100%);
  padding: 0 10px;

  :focus {
    background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #d9cea9 100%);
    outline: none;
  }
`

const SubmitInput = styled.input`
  height: 30px;
  width: 45px;
  border-radius: 10px;
  border: 2px ridge #d4af37;
  background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #aaa9ad 100%);

  :hover {
    background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #d4af37 100%);
  }
`

const SelectInput = styled.select`
  height: 30px;
  width: 100px;
  border: 2px ridge #d4af37;
  background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #aaa9ad 100%);
  padding: 0 10px;

  :focus {
    outline: none;
    background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #d9cea9 100%);
  }
`

const HealthInput = styled.input`
  height: 40px;
  width: 40px;
  text-align: center;
  font-size: 1.8rem;
  border: 2px ridge #d4af37;
  background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #aaa9ad 100%);
  padding: 0 10px;

  :focus {
    background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #d9cea9 100%);
    outline: none;
  }
`

export { SubmitInput, SelectInput, HealthInput }
export default Input