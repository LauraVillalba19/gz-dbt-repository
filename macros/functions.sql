{% macro margin_percent(revenue,purchase_cost,decimal_positions=2)%}
    ROUND({{revenue}}-{{purchase_cost}},{{decimal_positions}})
{%endmacro%}