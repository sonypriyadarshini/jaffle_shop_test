from vmuhmz1xac_emhcovfmerw_.utils import *

def DBT_0():
    from datetime import timedelta
    from airflow.operators.bash import BashOperator
    dbt_props_cmd = ""

    if "run_profile":
        dbt_props_cmd = " --profile run_profile"

    if "stg_customers":
        dbt_props_cmd = dbt_props_cmd + " -m " + "stg_customers"

    return BashOperator(
        task_id = "DBT_0",
        bash_command = f'''$PROPHECY_HOME/run_dbt.sh "{"; ".join(["dbt run" + dbt_props_cmd, "dbt test" + dbt_props_cmd])}"''',
        env = {
          "DBT_PROFILE_SECRET": "Tys0WX5G8U1qWHVuoXErr", 
          "GIT_TOKEN_SECRET": "rinIEoFuWpAcEw9_3UV4Yg_", 
          "GIT_ENTITY": "branch", 
          "GIT_ENTITY_VALUE": "branch", 
          "GIT_SSH_URL": "https://github.com/sonypriyadarshini/jaffle_shop_test", 
          "GIT_SUB_PATH": ""
        },
        append_env = True,
    )
