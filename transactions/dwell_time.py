import psycopg2


def main():
    conn = psycopg2.connect("dbname=physdk user=phypixel password=beacon5791 host=localhost")
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM version();")
    print(cursor.fetchone())



if __name__ == '__main__':
    main()