# Developing a Dietary Supplement Mixture

The objective is to formulate a livestock diet by mixing several distinct components, where each component possesses a
varied profile of essential nutrients. The problem requires determining the quantity of each component, subject to the
following technical rules:

1. **Overall Mass Requirement:** The summation of the chosen quantities of all ingredients must precisely equal the
   defined total mass.
2. **Nutrient Adequacy:** For every available nutrient, the calculated total amount derived from the chosen blend must
   fall within predefined minimum and maximum limits. This calculation involves multiplying the usage quantity of each
   component by its specific nutrient composition and summing these products across all components.
3. **Categorical Component Minimum:** The total combined quantity of components belonging to the designated grain set
   must be at least 20% of the total mass.

The solution seeks to minimize the total cost, calculated by summing the product of the usage quantity of each component
and its intrinsic unit cost.

[//]: # (Generated using gemma4:latest from D001 description.en.md and model.mzn; major manual amendments applied)
