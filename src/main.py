from database import connect_db

def main():

    # Connect to the Oracle database
    conn = connect_db()

    # Close the connection when done
    conn.close()

if __name__ == "__main__":
    main()