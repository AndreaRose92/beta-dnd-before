import styled from "styled-components";
 
export const NavButton = styled.div`
    display: grid;
    align-items: center;
    justify-content: center;
    background-color: blanchedalmond;

    .active {
        background-color: crimson;
    }
    :hover {
        background-color: aliceblue
    }
`
export const Logo = styled.h1`
    margin-top: 13px;
    text-align: right;
    margin-right: 20px;

    img {
        background-size: 0px;
    }
`
export const DropDown = styled.div`
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: blanchedalmond;
    color: silver;
    text-align: center;
    max-height: fit-content;

    .active {
        background-color: crimson;
    }
    :hover {
        background-color: aliceblue
    }
    :hover {
        display: block;
        >div {
            display: block;
        }
    }
`
export const DropDownContent = styled.div`
    display: none;
    max-height: fit-content;
    :hover {
        display: block;
    }
`
export const DropButton = styled(NavButton)`
    background-color: crimson;
    :hover {
        max-height: fit-content;
        background-color: gold;
        display: block;
    }
`

export const AuthForm = styled.div`
    display: flex;
    margin: 10px;
    justify-content: center;
    align-items: center;

    input {
        margin: 5px;
        height: 40px;
        width: 400px;
        font-size: x-large;
    }

    button {
        margin-left: 32%;
        height: 50px;
        width: 150px;
        font-size: large;
    }
`