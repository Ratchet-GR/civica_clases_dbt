{% docs purchase_segment%}
Categorización de la cantidad de compras por usuario a partir de `purchase_segment`.

| purchase_segment | Regla                                        |
|--------------|----------------------------------------------|
| never_bought | purchase_segment = 0 |
| one_purchase | purchase_segment = 1 |
| two_purchases | purchase_segment = 2|
| three_or_more | purchase_segment > 2|
{%enddocs%}