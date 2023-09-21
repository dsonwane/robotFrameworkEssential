import pytest


def capital_case(string):
    if not isinstance(string, str):
        raise TypeError("the argument must be a string")
    return string.capitalize()


def test_capital_case():
    assert capital_case("david")=="David"


def test_raise_exception_if_not_a_string():
    with pytest.raises(TypeError):
        capital_case()

