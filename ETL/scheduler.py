import schedule
import subprocess
import time
import os
from nbconvert import ScriptExporter
import nbformat


time_of_day = "13:50"
# Define the paths to your notebooks
notebook_paths = [
    r"C:\Users\kmakh\OneDrive - BITanium Consulting (Pty) Ltd\Attachments\Work\BITanium\data warehouse project\2024 Interns - DW Project\McD Data\ETL\load_staging_area_latest (1) (1).ipynb",
    r"C:\Users\kmakh\OneDrive - BITanium Consulting (Pty) Ltd\Attachments\Work\BITanium\data warehouse project\2024 Interns - DW Project\McD Data\ETL\loading_data_warehouse_latest.ipynb"
]

# Function to run a notebook
def run_notebook(notebook_path):
    print(f"Running notebook: {notebook_path}")
    try:
        # Create a ScriptExporter instance
        exporter = ScriptExporter()
        # Load the notebook
        with open(notebook_path, 'r', encoding='utf-8') as f:
            notebook = nbformat.read(f, as_version=4)
        # Export the notebook to a Python script
        (script, resources) = exporter.from_notebook_node(notebook)
        # Define the output Python script path
        python_script_path = os.path.splitext(notebook_path)[0] + ".py"
        # Write the Python script
        with open(python_script_path, 'w', encoding='utf-8') as f:
            f.write(script)
        # Run the generated Python script
        subprocess.run(["python", python_script_path], check=True)
        print(f"Notebook {notebook_path} completed successfully.")
        os.remove(python_script_path)
        print(python_script_path," file has been deleted.")
    except Exception as e:
        print(f"Error occurred while running {notebook_path}: {e}")

    print('all scripts ran successfully the next job is scheduled for tomorrow at :',time_of_day)

# Schedule each notebook to run at time_of_day (change as needed)
for notebook_path in notebook_paths:
    schedule.every().day.at(time_of_day).do(run_notebook, notebook_path)


# Main loop to continuously check for scheduled jobs
while True:
    schedule.run_pending()
    time.sleep(1)
